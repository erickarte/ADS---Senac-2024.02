import { Router } from "express";
import ClienteController from "../controllers/cliente.controller";

class ClienteRoutes {
  router = Router();
  controller = new ClienteController();

  constructor() {
    this.initializeRoutes();
  }

  initializeRoutes() {
    // Criar um novo Cliente.
    this.router.post("/cliente", this.controller.create);

    // Retornar os Clientes já cadastrados.
    this.router.get("/clientes", this.controller.findAll);

    // Retorna um Cliente específico pelo seu id
    this.router.get("/cliente/:id", this.controller.findOne);

    // Atualizar um Cliente pelo seu id
    this.router.put("/cliente/:id", this.controller.update);

    // Deleta um Cliente pelo seu id
    this.router.delete("/cliente/:id", this.controller.delete);

    // Deleta todos os Clientes
    this.router.delete("/clientes", this.controller.deleteAll);
  }
}

export default new ClienteRoutes().router;