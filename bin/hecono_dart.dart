import 'dart:io';

import 'package:nyxx/nyxx.dart';

void main() {
  final envToken = Platform.environment['TOKEN'];
  final bot = NyxxFactory.createNyxxWebsocket(
      '$envToken',
      GatewayIntents.guilds |
      GatewayIntents.messageContent |
      GatewayIntents.guildMessages
    );


  bot.eventsWs.onMessageReceived.listen((event) {
    final replyBuilder = ReplyBuilder.fromMessage(event.message);
    final allowedMentions = AllowedMentions();

    if (event.message.content == "!ping") {
      event.message.channel.sendMessage(
          MessageBuilder.content('Pong!')..replyBuilder = replyBuilder..allowedMentions = allowedMentions);
    }
  });

  bot.connect();
}
