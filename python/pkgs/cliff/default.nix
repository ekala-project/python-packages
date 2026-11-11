{
  lib,
  buildPythonPackage,
  fetchPypi,
  autopage,
  cmd2,
  openstackdocstheme,
  pbr,
  prettytable,
  pyyaml,
  stevedore,
  sphinxHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "cliff";
  version = "4.17.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-OtYe7kFaSHhLQtiL2uThfu8qcE72TbxSm7eTb2jwogA=";
  };

  # cliff 4.17 targets cmd2 4.x, which renamed the Statement redirection
  # fields; map them back to the cmd2 3.x names until cmd2 is updated.
  postPatch = ''
    substituteInPlace cliff/interactive.py \
      --replace-fail "redirector=statement.redirector," "pipe_to=statement.pipe_to, output=statement.output," \
      --replace-fail "redirect_to=statement.redirect_to," "output_to=statement.output_to,"
  '';

  pythonRelaxDeps = [ "cmd2" ];

  build-system = [
    openstackdocstheme
    pbr
    sphinxHook
  ];

  sphinxBuilders = [ "man" ];

  dependencies = [
    autopage
    cmd2
    prettytable
    pyyaml
    stevedore
  ];

  pythonImportsCheck = [ "cliff" ];

  meta = {
    description = "Command Line Interface Formulation Framework";
    homepage = "https://github.com/openstack/cliff";
    license = lib.licenses.asl20;
  };
})
