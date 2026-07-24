{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mistune";
  version = "3.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lepture";
    repo = "mistune";
    tag = "v${version}";
    hash = "sha256-7N1Kz2lN6GyDVKUhuGrEkbinV8Vpc4aahal/7KhnIXo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mistune" ];

  meta = {
    description = "Sane Markdown parser with useful plugins and renderers";
    homepage = "https://github.com/lepture/mistune";
    license = lib.licenses.bsd3;
  };
}
