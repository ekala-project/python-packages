{
  lib,
  buildPythonPackage,
  fetchPypi,
  pamqp,
  uv-build,
  yarl,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiormq";
  version = "6.9.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-DnwBtmKAThzHrOmhd5TowRkqJ/wq+pYWI2Km5hro6O8=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace "uv_build>=0.10.4,<0.11.0" uv_build
  '';

  pythonRelaxDeps = [ "pamqp" ];

  build-system = [ uv-build ];

  dependencies = [
    pamqp
    yarl
  ];

  # Tests require running a RabbitMQ server.
  # They rely on having AMQP_URL set or running Docker.

  pythonImportsCheck = [ "aiormq" ];

  meta = {
    description = "AMQP 0.9.1 asynchronous client library";
    homepage = "https://github.com/mosquito/aiormq";
    license = lib.licenses.asl20;
  };
})
