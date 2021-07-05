import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { ResponsesController } from './response.controller';
import { Response } from './models/response.entity';
import { ResponsesService } from './response.service';

@Module({
  imports: [TypeOrmModule.forFeature([Response])],
  providers: [ResponsesService],
  controllers: [ResponsesController],
})
export class ResponseModule {}
