{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  configargparse,
  acme,
  configobj,
  cryptography,
  distro,
  josepy,
  parsedatetime,
  pyrfc3339,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "certbot";
  version = "5.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "certbot";
    repo = "certbot";
    tag = "v${finalAttrs.version}";
    hash = "sha256-knaEk4bjC0cdnMiO4ENvaDm/i/3tn6ZOJPdyqJxLKOs=";
  };

  sourceRoot = "${finalAttrs.src.name}/certbot";

  build-system = [ setuptools ];

  dependencies = [
    configargparse
    acme
    configobj
    cryptography
    distro
    josepy
    parsedatetime
    pyrfc3339
  ];

  pythonImportsCheck = [ "certbot" ];

  meta = {
    homepage = "https://github.com/certbot/certbot";
    description = "ACME client that can obtain certs and extensibly update server configurations";
    platforms = lib.platforms.unix;
    mainProgram = "certbot";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
