FROM node:12 as builder


WORKDIR /usr/app

COPY . .

RUN yarn --pure-lockfile && yarn build

FROM node:12

ENV ENDPOINT http://localhost:3000/graphql
ENV PORT 80

WORKDIR /app
COPY --from=builder /usr/app/dist .
COPY --from=builder /usr/app/package.json ./package.json

RUN yarn --pure-lockfile --production

CMD ["node", "./index.js"]
