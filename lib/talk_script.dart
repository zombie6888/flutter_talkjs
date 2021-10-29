const String jsInit = """
  Talk.ready.then(function () {
    var me = new Talk.User({
      id: '123456',
      name: 'Alice',
      email: 'alice@example.com',
      photoUrl: 'https://demo.talkjs.com/old_demo/img/alice.jpg',
      welcomeMessage: 'Hey there! How are you? :-)',
    });
    window.talkSession = new Talk.Session({
      appId: 't3nmvHoq',
      me: me,
    });
    var other = new Talk.User({
      id: '654321',
      name: 'Sebastian',
      email: 'Sebastian@example.com',
      photoUrl: 'https://demo.talkjs.com/old_demo/img/sebastian.jpg',
      welcomeMessage: 'Hey, how can I help?',
    });

    var conversation = talkSession.getOrCreateConversation(
      Talk.oneOnOneId(me, other)
    );
    conversation.setParticipant(me);
    conversation.setParticipant(other);

    var inbox = talkSession.createInbox({ selected: conversation });
    inbox.mount(document.getElementById('talkjs-container'));
  });
""";
