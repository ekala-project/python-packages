{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  version = "4.0.1";
  pname = "pamqp";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "gmr";
    repo = "pamqp";
    tag = finalAttrs.version;
    hash = "sha256-WKkiwisCfGRkNbw8WtXqNe4OqUiRgVfVL7o0oMdeFJw=";
  };

  build-system = [ hatchling ];
  pythonImportsCheck = [
    "pamqp.base"
    "pamqp.body"
    "pamqp.commands"
    "pamqp.common"
    "pamqp.decode"
    "pamqp.encode"
    "pamqp.exceptions"
    "pamqp.frame"
    "pamqp.header"
    "pamqp.heartbeat"
  ];

  meta = {
    description = "RabbitMQ Focused AMQP low-level library";
    homepage = "https://github.com/gmr/pamqp";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
