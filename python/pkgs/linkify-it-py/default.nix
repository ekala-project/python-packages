{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  uc-micro-py,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "linkify-it-py";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tsutsu3";
    repo = "linkify-it-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-uFZBEBlM5IDN64ZydeNsUAZ2ssO4XRFPqPv5RoKEWwY=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ uc-micro-py ];

  pythonImportsCheck = [ "linkify_it" ];

  meta = {
    description = "Links recognition library with full unicode support";
    homepage = "https://github.com/tsutsu3/linkify-it-py";
    license = lib.licenses.mit;
  };
})
