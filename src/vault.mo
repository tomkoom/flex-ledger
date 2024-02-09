import Principal "mo:base/Principal";
import Ledger "./ledger";
import C "./_constants";

actor {
  let token = actor (C.tokenLedgerId) : Ledger.Self;

  public shared ({ caller }) func send(owner : Principal, amount : Nat) : async Ledger.Result {
    assert (caller == Principal.fromText(C.admin));

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
