import { Column, Entity } from 'typeorm';
import { BaseEntity } from 'src/common/entities/base-entity';

@Entity('forms')
export class Form extends BaseEntity {
  @Column({ type: 'int', nullable: false })
  user_id: number;
  @Column({ type: 'int', nullable: true })
  participants: number;
  @Column({ type: 'varchar', length: 100, nullable: false })
  title: string;
  @Column({ type: 'varchar', length: 100, nullable: false })
  link: string;
  @Column({ type: 'text', nullable: false })
  description: string;
  @Column({ type: 'date', nullable: false })
  deadline: Date;
}
