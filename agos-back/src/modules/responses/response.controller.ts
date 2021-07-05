import { Controller } from '@nestjs/common';
import { ResponsesService } from './response.service';

@Controller('responses')
export class ResponsesController {
  constructor(private readonly responsesService: ResponsesService) {}
}
