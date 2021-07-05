import {
  Column,
  CreateDateColumn,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

export class BaseEntity {
  @PrimaryGeneratedColumn()
  id?: number;

  @Column({ type: 'varchar', length: 11, nullable: false })
  ref_code?: string;

  @Column({ type: 'boolean', nullable: false, default: true })
  active: boolean;

  @CreateDateColumn({ nullable: true })
  createdAt?: Date;

  @UpdateDateColumn({ nullable: true })
  updatedAt?: Date;
}
