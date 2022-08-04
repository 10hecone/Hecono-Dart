import 'package:nyxx/nyxx.dart';

void main() {
  final bot = NyxxFactory.createNyxxWebsocket(
      "MTAwMTg3NzM1MTk5MjQxMDI1Mg.GmlhaD.0C9vsRBqeOWduYiRvcGxibBRQQ2Ej05G3qsGOU",
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
