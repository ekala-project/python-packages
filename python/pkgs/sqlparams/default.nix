{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "sqlparams";
  version = "6.2.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "cpburnz";
    repo = "python-sql-parameters";
    tag = "v${finalAttrs.version}";
    hash = "sha256-PcAv76ZtArJDbddziOMTiDmMXyDTieDpqMA92iG2vgA=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "sqlparams" ];

  meta = {
    description = "Convert DB API 2.0 named/numeric parameter styles to the style a driver supports";
    homepage = "https://github.com/cpburnz/python-sql-parameters";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
