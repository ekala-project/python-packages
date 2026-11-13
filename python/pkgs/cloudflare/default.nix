{
  lib,
  buildPythonPackage,
  fetchPypi,
  httpx,
  pydantic,
  typing-extensions,
  anyio,
  distro,
  sniffio,
  hatchling,
  hatch-fancy-pypi-readme,
}:

buildPythonPackage (finalAttrs: {
  pname = "cloudflare";
  version = "5.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-PhrI9x9QmNw1Qb/XeuDTq9cQrr70gJMCHn039rtYTKA=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'hatchling==1.26.3' 'hatchling>=1.26.3'
  '';

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
  ];

  dependencies = [
    httpx
    pydantic
    typing-extensions
    anyio
    distro
    sniffio
  ];

  # tests require networking

  pythonImportsCheck = [ "cloudflare" ];

  meta = {
    description = "Official Python library for the Cloudflare API";
    homepage = "https://github.com/cloudflare/cloudflare-python";
    license = lib.licenses.asl20;
  };
})
