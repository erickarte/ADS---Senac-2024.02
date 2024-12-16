import { Router } from "express";
import ServicoController from "../controllers/servico.controller";

class ServicoRoutes {
  router = Router();
  controller = new ServicoController();

  constructor() {
    this.initializeRoutes();
  }

  initializeRoutes() {
    // Criar um novo Serviço.
    this.router.post("/servico", this.controller.create);

    // Retornar os Serviços já cadastrados.
    this.router.get("/servicos", this.controller.findAll);

    // Retorna um Serviço específico pelo seu id
    this.router.get("/servico/:id", this.controller.findOne);

    // Atualizar um Serviço pelo seu id
    this.router.put("/servico/:id", this.controller.update);

    // Deleta um Serviço pelo seu id
    this.router.delete("/servico/:id", this.controller.delete);

    // Deleta todos os Serviços
    this.router.delete("/servicos", this.controller.deleteAll);
  }
}

export default new ServicoRoutes().router;