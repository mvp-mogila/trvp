const middlewares = require('../middlewares/middlewares');

const {Router} = require("express");
const router = Router();

router.use(middlewares.corsAll);

/**
 * Обработка preflight options-запроса для cors
 */
router.options('*', function (req, res) {
    origin = req.headers.origin
    res.header("Access-Control-Allow-Origin", origin);
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS');
    res.header("Access-Control-Allow-Credentials", "true");
    res.send();
});

module.exports = router;
