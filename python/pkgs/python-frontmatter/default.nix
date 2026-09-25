{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  pyyaml,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-frontmatter";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "eyeseast";
    repo = "python-frontmatter";
    tag = "v${version}";
    sha256 = "sha256-b/ruWPPiKvDzMjcVhxiBtnAaMNWnWvy1v8GZxGeibyY=";
  };

  postPatch = ''
        substituteInPlace pyproject.toml \
          --replace-fail 'requires = ["uv_build>=0.11.15,<0.12"]' 'requires = ["setuptools"]' \
          --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'

        # uv_build had module-name = "frontmatter"; tell setuptools where to find it
        cat >> pyproject.toml <<'EOF'

    [tool.setuptools.packages.find]
    include = ["frontmatter*"]
    EOF
  '';

  build-system = [ setuptools ];

  dependencies = [
    pyyaml
  ];

  # tries to import test.test, which conflicts with module
  # exported by python interpreter
  doCheck = false;
  pythonImportsCheck = [ "frontmatter" ];

  meta = {
    homepage = "https://github.com/eyeseast/python-frontmatter";
    description = "Parse and manage posts with YAML (or other) frontmatter";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
  };
}
