import { Request, Response } from "express";
import clienteRepository from "../repositories/cliente.repository";
import { Cliente } from "../models/cliente";

export default class ClienteController {

    async create(req: Request, res: Response) {
       const {nome, email, telefone, dataAniversario} = req.body;
        if (!req.body.nome || !req.body.email || !req.body.telefone || !req.body.dataAniversario) {
            res.status(400).send({
                message: "Nome, email e telefone são obrigatórios!",
            });
            return;
        }

        try {
            const cliente: Cliente = req.body;
            const savedCliente = await clienteRepository.save(cliente);
            res.status(201).send(savedCliente);
        } catch (err) {
            res.status(500).send({
                message: "Erro ao tentar salvar o cliente.",
            });
        }
    }

    async findAll(req: Request, res: Response) {
        try {
            const clientes = await clienteRepository.retrieveAll();
            res.status(200).send(clientes);
        } catch (err) {
            res.status(500).send({
                message: "Erro ao buscar todos os clientes.",
            });
        }
    }

    async findOne(req: Request, res: Response) {
        const id: number = parseInt(req.params.id);

        try {
            const cliente = await clienteRepository.retrieveById(id);
            if (cliente) {
                res.status(200).send(cliente);
            } else {
                res.status(404).send({
                    message: `Cliente com id=${id} não encontrado.`,
                });
            }
        } catch (err) {
            res.status(500).send({
                message: `Erro ao buscar o cliente com id=${id}.`,
            });
        }
    }

    async update(req: Request, res: Response) {
        const id: number = parseInt(req.params.id);
        let cliente: Cliente = req.body;
        cliente.idCliente = id;

        try {
            await clienteRepository.update(cliente);
            res.send({
                message: `Cliente ${cliente.nome} atualizado com sucesso!`,
            });
        } catch (err) {
            res.status(500).send({
                message: `Erro ao atualizar o cliente com id=${id}.`,
            });
        }
    }

    async delete(req: Request, res: Response) {
        const id: number = parseInt(req.params.id);

        try {
            const num = await clienteRepository.delete(id);

            if (num === 1) {
                res.send({
                    message: "Cliente deletado com sucesso!",
                });
            } else {
                res.status(404).send({
                    message: `Cliente com id=${id} não encontrado.`,
                });
            }
        } catch (err) {
            res.status(500).send({
                message: `Erro ao deletar o cliente com id=${id}.`,
            });
        }
    }

    async deleteAll(req: Request, res: Response) {
        try {
            const num = await clienteRepository.deleteAll();
            res.send({ message: `${num} clientes foram deletados com sucesso!` });
        } catch (err) {
            res.status(500).send({
                message: "Erro ao deletar todos os clientes.",
            });
        }
    }
}