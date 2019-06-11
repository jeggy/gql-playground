import express from 'express'
import playground from 'graphql-playground-middleware-express';

const endpoint = process.env.ENDPOINT || 'http://localhost:3000/graphql';
const port = process.env.PORT || 80;

const app = express();

app.use('/', playground({
    endpoint,
    settings: {
        'editor.theme': 'light',
    }
}));

app.listen(port, () => {
    console.log(`playground listening on ${port}`)
});
