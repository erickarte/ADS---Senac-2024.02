import { AppDataSource } from "../db/data-source";
import { Cliente } from "../models/cliente";

class ClienteRepository {
    clienteRepository = AppDataSource.getRepository(Cliente);

    async save(cliente: Cliente): Promise<Cliente> {
        try {
            await this.clienteRepository.save(cliente);
            return cliente;
        } catch (err) {
            throw new Error("Falha ao salvar o cliente!");
        }
    }

    async retrieveAll(): Promise<Array<Cliente>> {
        try {
            return this.clienteRepository.find();
        } catch (error) {
            throw new Error("Falha ao retornar os clientes!");
        }
    }

    async retrieveById(clienteId: number): Promise<Cliente | null> {
        try {
            return this.clienteRepository.findOneBy({
                idCliente: clienteId,
            });
        } catch (error) {
            throw new Error("Falha ao buscar o cliente!");
        }
    }

    async update(cliente: Cliente): Promise<Cliente> {
        try {
            const clienteExistente = await this.clienteRepository.findOneBy({
                idCliente: cliente.idCliente,
            });

            if (!clienteExistente) {
                throw new Error("Cliente não encontrado para atualização!");
            }

            await this.clienteRepository.save(cliente);
            return cliente;
        } catch (error) {
            throw new Error("Falha ao atualizar o cliente!");
        }
    }

    async delete(clienteId: number): Promise<number> {
        try {
            const clienteEncontrado = await this.clienteRepository.findOneBy({
                idCliente: clienteId,
            });

            if (clienteEncontrado) {
                await this.clienteRepository.remove(clienteEncontrado);
                return 1;
            }
            return 0;
        } catch (error) {
            throw new Error("Falha ao deletar o cliente!");
        }
    }

    async deleteAll(): Promise<number> {
        try {
            const countResult = await this.clienteRepository.query("SELECT COUNT(idCliente) as count FROM Cliente;");
            const count = countResult[0]?.count || 0;
            
            await this.clienteRepository.query("DELETE FROM Cliente;");
            return count;
        } catch (error) {
            throw new Error("Falha ao deletar todos os clientes!");
        }
    }
}

export default new ClienteRepository();