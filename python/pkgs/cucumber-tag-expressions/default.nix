{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  pyyaml,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "cucumber-tag-expressions";
  version = "11.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cucumber";
    repo = "tag-expressions";
    tag = "v${finalAttrs.version}";
    hash = "sha256-6rC5IOzujhwex24DjL0KY8w9sZXk8+DgZGUOU5vKWPo=";
  };

  sourceRoot = "${finalAttrs.src.name}/python";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.12.0,<0.13.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [
    setuptools
  ];
  meta = {
    homepage = "https://github.com/cucumber/tag-expressions";
    description = "Provides tag-expression parser for cucumber/behave";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
