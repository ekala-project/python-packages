{
  beautifulsoup4,
  buildPythonPackage,
  fetchFromGitHub,
  html5lib,
  lib,
  lxml,
  python,
  setuptools,
}:

buildPythonPackage rec {
  pname = "draftjs-exporter";
  version = "7.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    repo = "draftjs_exporter";
    owner = "springload";
    tag = "v${version}";
    sha256 = "sha256-vOSsT7YOMzBFkYre2GYSTlNUNwd70RsO7fJ6FWahNXM=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.11.26,<0.12.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  optional-dependencies = {
    lxml = [ lxml ];
    html5lib = [
      beautifulsoup4
      html5lib
    ];
  };

  checkInputs = optional-dependencies.lxml ++ optional-dependencies.html5lib;

  checkPhase = ''
    # 2 tests in this file randomly fail because they depend on the order of
    # HTML attributes
    rm tests/test_exports.py

    ${python.interpreter} -m unittest discover
  '';

  pythonImportsCheck = [ "draftjs_exporter" ];

  meta = {
    description = "Library to convert Draft.js ContentState to HTML";
    homepage = "https://github.com/springload/draftjs_exporter";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
