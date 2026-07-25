{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  babel,
  jinja2,
  json5,
  jsonschema,
  jupyter-server,
  packaging,
  requests,

  # optional-dependencies
  openapi-core,
  ruamel-yaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "jupyterlab-server";
  version = "2.28.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyterlab";
    repo = "jupyterlab_server";
    tag = "v${finalAttrs.version}";
    hash = "sha256-/h25HBKt6maaxuZRK+VMVA0AqTZhQkDnGVDgBisQcCw=";
  };

  patches = [
    # oopenapi-core changed their API, which breaks jupyterlab-server
    ./fix-openapi-core-compat.patch
  ];

  build-system = [
    hatchling
  ];

  dependencies = [
    babel
    jinja2
    json5
    jsonschema
    jupyter-server
    packaging
    requests
  ];

  optional-dependencies = {
    openapi = [
      openapi-core
      ruamel-yaml
    ];
  };

  pythonImportsCheck = [ "jupyterlab_server" ];
  meta = {
    description = "Set of server components for JupyterLab and JupyterLab like applications";
    homepage = "https://github.com/jupyterlab/jupyterlab_server";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
