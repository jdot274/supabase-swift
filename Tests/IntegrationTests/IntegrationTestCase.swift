import XCTest

class IntegrationTestCase: XCTestCase {
  override func setUpWithError() throws {
    try super.setUpWithError()

    try skipUnlessIntegrationEnabled()
  }

  override func setUp() async throws {
    try await super.setUp()

    try skipUnlessIntegrationEnabled()
  }

  private func skipUnlessIntegrationEnabled() throws {
    guard let runIntegrationTests = ProcessInfo.processInfo.environment["RUN_INTEGRATION_TESTS"],
      ["1", "true", "yes"].contains(runIntegrationTests.lowercased())
    else {
      throw XCTSkip(
        "Integration tests require a local Supabase stack. Set RUN_INTEGRATION_TESTS=1 and run `make test-integration`."
      )
    }
  }
}
