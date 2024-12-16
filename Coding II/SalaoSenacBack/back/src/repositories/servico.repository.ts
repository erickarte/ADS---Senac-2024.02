import { AppDataSource } from "../db/data-source";
import { Servico } from "../models/servico";

class ServicoRepository {
    servicoRepository = AppDataSource.getRepository(Servico);

    async save(servico: Servico): Promise<Servico> {
        try {
            await this.servicoRepository.save(servico);
            return servico;
        } catch (err) {
            throw new Error("Falha ao salvar o serviço!");
        }
    }

    async retrieveAll(): Promise<Array<Servico>> {
        try {
            return this.servicoRepository.find();
        } catch (error) {
            throw new Error("Falha ao retornar os serviços!");
        }
    }

    async retrieveById(servicoId: number): Promise<Servico | null> {
        try {
            return this.servicoRepository.findOneBy({
                idServico: servicoId,
            });
        } catch (error) {
            throw new Error("Falha ao buscar o serviço!");
        }
    }

    async update(servico: Servico): Promise<Servico> {
        try {
            const servicoExistente = await this.servicoRepository.findOneBy({
                idServico: servico.idServico,
            });

            if (!servicoExistente) {
                throw new Error("Serviço não encontrado para atualização!");
            }

            await this.servicoRepository.save(servico);
            return servico;
        } catch (error) {
            throw new Error("Falha ao atualizar o serviço!");
        }
    }

    async delete(servicoId: number): Promise<number> {
        try {
            const servicoEncontrado = await this.servicoRepository.findOneBy({
                idServico: servicoId,
            });

            if (servicoEncontrado) {
                await this.servicoRepository.remove(servicoEncontrado);
                return 1;
            }
            return 0;
        } catch (error) {
            throw new Error("Falha ao deletar o serviço!");
        }
    }

    async deleteAll(): Promise<number> {
        try {
            const countResult = await this.servicoRepository.query("SELECT COUNT(idServico) as count FROM Servicos;");
            const count = countResult[0]?.count || 0;
            
            await this.servicoRepository.query("DELETE FROM Servicos;");
            return count;
        } catch (error) {
            throw new Error("Falha ao deletar todos os serviços!");
        }
    }
}

export default new ServicoRepository();
