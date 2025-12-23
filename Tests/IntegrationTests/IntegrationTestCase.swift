import XCTest

class IntegrationTestCase: XCTestCase {
  private static let enabledValues: Set<String> = ["1", "true", "yes"]

  override func setUpWithError() throws {
    try super.setUpWithError()

    try skipUnlessIntegrationEnabled()
  }

  // Async test suites override setUp(), so guard here as well to ensure integration tests are skipped
  // when the required environment flag is missing.
  override func setUp() async throws {
    try await super.setUp()

    try skipUnlessIntegrationEnabled()
  }

  private func skipUnlessIntegrationEnabled() throws {
    guard let runIntegrationTests = ProcessInfo.processInfo.environment["RUN_INTEGRATION_TESTS"],
      Self.enabledValues.contains(runIntegrationTests.lowercased())
    else {
      throw XCTSkip(
        "Integration tests require a local Supabase stack. Set RUN_INTEGRATION_TESTS=1 and run `make test-integration`."
      )
    }
  }
}
