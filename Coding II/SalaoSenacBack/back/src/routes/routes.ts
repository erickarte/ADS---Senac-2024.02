import { Application } from "express";
import clienteRoutes from "./cliente.routes";
import servicoRoutes from "./servico.routes";

// Concentrador de rotas
export default class Routes {
  constructor(app: Application) {
    app.use("/salaosenacback", clienteRoutes);
    app.use("/salaosenacback", servicoRoutes);
  }
}