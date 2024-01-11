import Principal "mo:base/Principal";

// ...
import Ledger "./ledger";

actor {

  let admin = "qacbl-dmvvz-7f4rd-qdkp2-drupw-qch3e-35tpx-xl6gh-my5bf-wndbh-xae";

  // token
  let tokenCanister = "fq7md-ayaaa-aaaag-abpea-cai"; // ic
  let token = actor (tokenCanister) : Ledger.Self;

  public shared ({ caller }) func mint(owner : Principal, amount : Nat) : async Ledger.Result {
    assert (caller == Principal.fromText(admin));
    assert (not Principal.isAnonymous(owner));

    let to : Ledger.Account = {
      owner;
      subaccount = null;
    };
    let transferArg : Ledger.TransferArg = {
      to;
      fee = null;
      memo = null;
      from_subaccount = null;
      created_at_time = null;
      amount;
    };
    await token.icrc1_transfer(transferArg);
  };
};
