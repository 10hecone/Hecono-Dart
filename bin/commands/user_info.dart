import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

ChatCommand ui = ChatCommand.textOnly(
  'user-info',
  "Checks user info",
  (MessageChatContext context) {
    final embed = EmbedBuilder()
      ..title = 'Command: ${context.message.content.substring(1)}'
      ..description = 'Reply to ${context.message.author.tag}'
      ..addField(
          name: 'Author Tag:', content: '```${context.message.author.tag}```', inline: true)
      ..addField(
          name: 'Author ID:', content: '```${context.message.author.id}```', inline: true)
      ..addField(
          name: 'Bot:', content: '```${context.message.author.bot ? '🟢' : '🔴'}```', inline: true)
      ..addField(
          name: 'Username:', content: '```${context.message.author.username}```', inline: true)
      ..addField(
          name: 'CreatedAt:', content: '```${context.user.createdAt}```', inline: true)
      ..addField(
          name: 'JoinedAt:', content: '```${context.message.member?.joinedAt}```', inline: true)
      ..thumbnailUrl = context.message.author.avatarURL(format: 'png')
      ..color = DiscordColor.fromRgb(229, 229, 228);
    context.respond(MessageBuilder.content(' ')..embeds = [embed]);
  },
);
