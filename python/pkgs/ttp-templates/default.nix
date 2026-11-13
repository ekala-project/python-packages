{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pydantic,
  ttp,
}:

buildPythonPackage (finalAttrs: {
  pname = "ttp-templates";
  version = "0.5.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dmulyalin";
    repo = "ttp_templates";
    tag = finalAttrs.version;
    hash = "sha256-W6F0/CGm713HhCtgqv+tEDm5mlkx0JJRmnUc9j+Fnvs=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    pydantic
    ttp
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "0.5.7"' 'version = "${finalAttrs.version}"'
    # Drop circular dependency on ttp
    sed -i '/ttp =/d' pyproject.toml
  '';

  pythonImportsCheck = [ "ttp_templates" ];

  meta = {
    description = "Template Text Parser Templates collections";
    homepage = "https://github.com/dmulyalin/ttp_templates";
    license = lib.licenses.mit;
  };
})
