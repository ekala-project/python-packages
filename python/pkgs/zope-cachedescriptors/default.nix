{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope-cachedescriptors";
  version = "6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "zope.cachedescriptors";
    tag = finalAttrs.version;
    hash = "sha256-PlezUzuO4P/BOVT6Ll8dYIKssC/glmVd8SCM0afgNC0=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  dependencies = [ setuptools ];

  pythonImportsCheck = [ "zope.cachedescriptors" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Method and property caching decorators";
    homepage = "https://github.com/zopefoundation/zope.cachedescriptors";
    license = lib.licenses.zpl21;
  };
})
