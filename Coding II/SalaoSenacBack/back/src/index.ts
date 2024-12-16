import express, { Application } from "express";
import cors, { CorsOptions } from "cors";
import ClienteRoutes from "./routes/cliente.routes";
import ServicoRoutes from "./routes/servico.routes";
import { AppDataSource } from "./db/data-source";

export default class Server {
  constructor(app: Application) {
    this.config(app);
    this.initializeRoutes(app);
  }

  private config(app: Application): void {
    const corsOptions: CorsOptions = {
      origin: "http://localhost:8081"
    };
    app.use(cors(corsOptions));
    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
  }

  private initializeRoutes(app: Application): void {
    app.use("/api", ClienteRoutes);
    app.use("/api", ServicoRoutes);
  }
}

AppDataSource.initialize()
  .then(() => {
    console.log(`Database is running.`);
  })
  .catch((error) => console.log(error));