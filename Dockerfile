FROM node:20-slim AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS build
COPY . .
# WORKDIR /usr/src/app
RUN pnpm install
RUN pnpm add bunchee -w
RUN pnpm build
EXPOSE 3002
EXPOSE 3001
EXPOSE 3003
CMD [ "pnpm", "dev" ]