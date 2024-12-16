import { Request, Response } from "express";
import servicoRepository from "../repositories/servico.repository";
import { Servico } from "../models/servico";

export default class ServicoController {

    async create(req: Request, res: Response) {
        if (!req.body.nome || req.body.valor === undefined) {
            res.status(400).send({
                message: "Nome e valor do serviço são obrigatórios!",
            });
            return;
        }

        try {
            const servico: Servico = req.body;
            const savedServico = await servicoRepository.save(servico);
            res.status(201).send(savedServico);
        } catch (err) {
            res.status(500).send({
                message: "Erro ao tentar salvar o serviço.",
            });
        }
    }

    async findAll(req: Request, res: Response) {
        try {
            const servicos = await servicoRepository.retrieveAll();
            res.status(200).send(servicos);
        } catch (err) {
            res.status(500).send({
                message: "Erro ao buscar todos os serviços.",
            });
        }
    }

    async findOne(req: Request, res: Response) {
        const id: number = parseInt(req.params.id);

        try {
            const servico = await servicoRepository.retrieveById(id);
            if (servico) {
                res.status(200).send(servico);
            } else {
                res.status(404).send({
                    message: `Serviço com id=${id} não encontrado.`,
                });
            }
        } catch (err) {
            res.status(500).send({
                message: `Erro ao buscar o serviço com id=${id}.`,
            });
        }
    }

    async update(req: Request, res: Response) {
        const id: number = parseInt(req.params.id);
        let servico: Servico = req.body;
        servico.idServico = id;

        try {
            await servicoRepository.update(servico);
            res.send({
                message: `Serviço ${servico.nome} atualizado com sucesso!`,
            });
        } catch (err) {
            res.status(500).send({
                message: `Erro ao atualizar o serviço com id=${id}.`,
            });
        }
    }

    async delete(req: Request, res: Response) {
        const id: number = parseInt(req.params.id);

        try {
            const num = await servicoRepository.delete(id);

            if (num === 1) {
                res.send({
                    message: "Serviço deletado com sucesso!",
                });
            } else {
                res.status(404).send({
                    message: `Serviço com id=${id} não encontrado.`,
                });
            }
        } catch (err) {
            res.status(500).send({
                message: `Erro ao deletar o serviço com id=${id}.`,
            });
        }
    }

    async deleteAll(req: Request, res: Response) {
        try {
            const num = await servicoRepository.deleteAll();
            res.send({ message: `${num} serviços foram deletados com sucesso!` });
        } catch (err) {
            res.status(500).send({
                message: "Erro ao deletar todos os serviços.",
            });
        }
    }
}