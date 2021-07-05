import { ConfigModule, ConfigService } from '@nestjs/config';
import {
  TypeOrmModuleAsyncOptions,
  TypeOrmModuleOptions,
} from '@nestjs/typeorm';

export default class TypeOrmConfig {
  static getOrmConfig(configService: ConfigService): TypeOrmModuleOptions {
    return {
      type: 'postgres',
      username: configService.get('DB_USERNAME'),
      password: configService.get('DB_PASSWORD'),
      host: configService.get('DB_HOST'),
      port: configService.get('DB_PORT'),
      database: configService.get('DB_DATABASE'),
      synchronize: true,
      entities: ['dist/**/*.entity{.ts,.js}'],
    };
  }
}

export const config: TypeOrmModuleAsyncOptions = {
  imports: [ConfigModule],
  useFactory: async (
    configService: ConfigService,
  ): Promise<TypeOrmModuleAsyncOptions> =>
    TypeOrmConfig.getOrmConfig(configService),
  inject: [ConfigService],
};
