{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # tests
}:

buildPythonPackage (finalAttrs: {
  pname = "logistro";
  version = "2.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "geopozo";
    repo = "logistro";
    tag = "v${finalAttrs.version}";
    hash = "sha256-c/wHOXDPDUYvfJCcLodbHzFdXGscvXEmOyPKCuzPIT0=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail ', "setuptools-git-versioning"' "" \
      --replace-fail 'dynamic = ["version"]' 'version = "${finalAttrs.version}"'
  '';

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "logistro" ];
  meta = {
    description = "Wrapper for logging";
    homepage = "https://github.com/geopozo/logistro";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
