import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gossip_v01/model/message.dart';

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final AuthService _auth = new AuthService();

  //get all users stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((event) {
      return event.docs
          .where((doc) => doc.data()['email'] != _auth.currentUser!.email)
          .map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });

    // return _firestore
    //     .collection("Users")
    //     .snapshots()
    //     .map((event) => event.docs.map((e) => e.data()).toList());
  }

//get all expect blocked user
  Stream<List<Map<String, dynamic>>> getUsersStreamExpBlocked() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection('Users')
        .doc(currentUser!.uid)
        .collection('BlockedUsers')
        .snapshots()
        .asyncMap((snap) async {
      //get blocked user ids
      final blockedUserIds = snap.docs.map((e) => e.id).toList();

      final userSnap = await _firestore.collection('Users').get();

      return userSnap.docs
          .where((element) =>
              element.data()['email'] != currentUser.email &&
              !blockedUserIds.contains(element.id))
          .map((e) => e.data())
          .toList();
    });
  }

  Future<void> sendMessage(String receiverID, message) async {
    // final String currentUserID = _auth.getCurrentUser()!.uid;
    // final String currentUserEmail = _auth.getCurrentUser()!.email!;
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;

    //create message
    Message newMessage = new Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
    );

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  Future<void> reportMessage(String messageId, String userID) async {
    final currentUser = _auth.currentUser;
    final report = {
      'reportBy': currentUser!.uid,
      'messageId': messageId,
      'messageOwnerId': userID,
      'timestamp': FieldValue.serverTimestamp(),
    };
    await _firestore.collection("Reports").add(report);
  }

  Future<void> blockUser(String userID) async {
    final currentUser = _auth.currentUser;

    await _firestore
        .collection("Users")
        .doc(currentUser!.uid)
        .collection("BlockedUsers")
        .doc(userID)
        .set({});
    // notifyListeners();
  }

//unblock user
  Future<void> unblockUser(String userID) async {
    final currentUser = _auth.currentUser;

    await _firestore
        .collection("Users")
        .doc(currentUser!.uid)
        .collection("BlockedUsers")
        .doc(userID)
        .delete();
  }

  //get blocked users stream
  Stream<List<Map<String, dynamic>>> getBlockedUsersStream(String userId) {
    return _firestore
        .collection('Users')
        .doc(userId)
        .collection('BlockedUsers')
        .snapshots()
        .asyncMap((snapshot) async {
      final blockedUserIds = snapshot.docs.map((e) => e.id).toList();

      final userDocs = await Future.wait(
        blockedUserIds.map((e) => _firestore.collection('Users').doc(e).get()),
      );
      return userDocs.map((e) => e.data() as Map<String, dynamic>).toList();
    });
  }
}
