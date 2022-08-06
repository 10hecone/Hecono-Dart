import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

ChatCommand ping = ChatCommand(
  'ping',
  "Checks if the bot's online",
  (IChatContext context) {
    // For a ping command, all we need to do is respond with `pong`.
    // To do that, we can use the `Context`'s `respond` method which responds to the command with
    // a message.
    context.respond(MessageBuilder.content('Pong!'));
    
  },
);

