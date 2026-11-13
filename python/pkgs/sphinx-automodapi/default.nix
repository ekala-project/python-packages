{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchurl,
  setuptools-scm,
  sphinx,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinx-automodapi";
  version = "0.22.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astropy";
    repo = "sphinx-automodapi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-jr/fPxGP6SZQTlz8QQEETJCj1a/8TDxbkCTbsVyqnJA=";
  };

  build-system = [ setuptools-scm ];

  env.SETUPTOOLS_SCM_PRETEND_VERSION = finalAttrs.version;

  dependencies = [ sphinx ];

  # https://github.com/astropy/sphinx-automodapi/issues/155
  testInventory = fetchurl {
    # Originally: https://docs.python.org/3/objects.inv
    url = "https://web.archive.org/web/20221007193144/https://docs.python.org/3/objects.inv";
    hash = "sha256-1cbUmdJJSoifkiIYa70SxnLsaK3F2gvnTEWo9vo/6rY=";
  };

  postPatch = ''
    substituteInPlace sphinx_automodapi/tests/{helpers,test_cases}.py \
      --replace ", None)" ", (None, '${finalAttrs.testInventory}'))"
  '';

  pythonImportsCheck = [ "sphinx_automodapi" ];

  meta = {
    description = "Sphinx extension for generating API documentation";
    homepage = "https://github.com/astropy/sphinx-automodapi";
    license = lib.licenses.bsd3;
  };
})
