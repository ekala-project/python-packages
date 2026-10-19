{
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  buildPythonPackage,
  pyusb,
}:

buildPythonPackage (finalAttrs: {
  pname = "usbtmc";
  version = "0.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-ivi";
    repo = "python-usbtmc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-69kqBTqnVqdWC2mqlXylzb9VkdhwTGZI0Ykf6lqbypI=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyusb ];

  meta = {
    description = "Python implementation of the USBTMC instrument control protocol";
    homepage = "http://alexforencich.com/wiki/en/python-usbtmc/start";
    license = lib.licenses.mit;
  };
})
