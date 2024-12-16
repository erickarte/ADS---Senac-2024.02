import { Entity, PrimaryGeneratedColumn, Column} from 'typeorm';

@Entity()
export class Cliente {
    @PrimaryGeneratedColumn()
    idCliente?: number;

    @Column({ length: 45 })
    nome: string;

    @Column({ length: 45 })
    email: string;

    @Column({ length: 15 })
    telefone: string;

    @Column({ nullable: true })
    dataAniversario?: Date;

    constructor(nome: string, email: string, telefone: string, dataAniversario?: Date) {
        this.nome = nome;
        this.email = email;
        this.telefone = telefone;
        this.dataAniversario = dataAniversario;
    }
}