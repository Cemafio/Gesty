import Fastify from "fastify";
import prismaPlugin from "./plugins/prisma";

export const app = Fastify({
  logger: true
});

app.register(prismaPlugin);

app.get("/users", async (req, reply) => {
  const users = await app.prisma.user.findMany();

  return users;
});