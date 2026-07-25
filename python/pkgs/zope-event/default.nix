{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools_80,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope-event";
  version = "6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "zope.event";
    tag = finalAttrs.version;
    hash = "sha256-FoE9bdr/JcOaB8/OQTUmxGrNgIDc1vPDlmZq0v+bjmQ=";
  };

  build-system = [ setuptools_80 ];

  pythonImportsCheck = [ "zope.event" ];
  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Event publishing system";
    homepage = "https://github.com/zopefoundation/zope.event";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
})
