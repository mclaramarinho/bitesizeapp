enum CreateAccountSteps {
  stepOne,
  stepTwo;

  CreateAccountSteps next() {
    return CreateAccountSteps.values[(index + 1) % CreateAccountSteps.values.length];
  }

  CreateAccountSteps previous() {
    return CreateAccountSteps.values[(index - 1) % CreateAccountSteps.values.length];
  }
}