import { Module, Global } from '@nestjs/common';
import { DatabaseService } from './database.service';

@Global()
@Module({
  providers: [DatabaseService],
  exports: [PrismaService],
})
export class DatabaseModule {}

