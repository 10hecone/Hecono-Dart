import 'dart:io';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';
import 'commands/message.dart';
import 'commands/ping.dart';
import 'commands/user_info.dart';

late final INyxxWebsocket bot;

void main() {
  final envToken = Platform.environment['TOKEN'];
  bot = NyxxFactory.createNyxxWebsocket(
      '$envToken',
      GatewayIntents.guilds |
          GatewayIntents.messageContent |
          GatewayIntents.guildMessages | GatewayIntents.guildMembers,
     cacheOptions: CacheOptions()..memberCachePolicyLocation = CachePolicyLocation.all()..memberCachePolicy = MemberCachePolicy.all );

  bot.eventsWs.onReady.listen((event) {
    print('Test');
  });

  bot
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions());

  CommandsPlugin commands = CommandsPlugin(
    prefix: (message) => '!',
    guild: Snowflake(Platform.environment['GUILD']!),
    options: CommandsOptions(
      logErrors: true,
    ),
  );

  bot.registerPlugin(commands);

  bot.connect();

  commands.addCommand(ping);
  commands.addCommand(message);
  commands.addCommand(ui);
}
