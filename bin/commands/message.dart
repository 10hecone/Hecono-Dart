import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

ChatCommand message = ChatCommand.textOnly(
  'debug-message',
  "Checks information message",
  (MessageChatContext context) {
    final embed = EmbedBuilder()
      ..title = 'Command: ${context.message.content.substring(1)}'
      ..description = 'Reply to ${context.message.author.tag}'
      ..addField(
          name: 'Content:', content: '```${context.message.content}```', inline: true)
      ..addField(
          name: 'Author:', content: '```${context.message.author.tag}```', inline: true)
      ..addField(
          name: 'Length:',
          content: '```${context.message.content.length}```',
          inline: true)
      ..addField(name: 'Id:', content: '```${context.message.id}```', inline: true)
      ..thumbnailUrl = context.message.author.avatarURL(format: 'png')
      ..color = DiscordColor.fromRgb(229, 229, 228);
    context.respond(MessageBuilder.content(' ')..embeds = [embed]);
  },
);
