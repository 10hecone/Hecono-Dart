import 'dart:io';

import 'package:nyxx/nyxx.dart';

void main() {
  final envToken = Platform.environment['TOKEN'];
  final bot = NyxxFactory.createNyxxWebsocket(
      '$envToken',
      GatewayIntents.guilds |
          GatewayIntents.messageContent |
          GatewayIntents.guildMessages);

  bot.eventsWs.onMessageReceived.listen((event) {
    if (event.message.author.bot) return;

    String prefix = '!';

    final replyBuilder = ReplyBuilder.fromMessage(event.message);
    final embedBuiderContent = EmbedBuilder()
      ..title = 'Command: ${event.message.content.substring(1)}'
      ..description = '''
      Content: ${event.message.content}
      Length: ${event.message.content.length}
      Author: ${event.message.author}
      '''
      ..color = DiscordColor.fromRgb(140, 140, 140);
    final embedBuilderPing = EmbedBuilder()
      ..title = 'Command: ${event.message.content.substring(1)}'
      ..description = 'Pong!'
      ..color = DiscordColor.fromRgb(140, 140, 140);

    if (event.message.content == "${prefix}ping") {
      event.message.channel.sendMessage(MessageBuilder.content(' ')
        ..replyBuilder = replyBuilder
        ..embeds = [embedBuilderPing]);
    } else if (event.message.content ==
        "$prefix${event.message.content.substring(1)}") {
      event.message.channel.sendMessage(MessageBuilder.content(' ')
        ..replyBuilder = replyBuilder
        ..embeds = [embedBuiderContent]);
    }
  });

  bot.eventsWs.onGuildMemberAdd.listen((event) {
    print(event.member.id);
  });

  bot.connect();
}
