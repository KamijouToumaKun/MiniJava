//
// Generated by JTB 1.3.2
//

package kanga.syntaxtree;

/**
 * Grammar production:
 * f0 -> "CJUMP"
 * f1 -> Reg()
 * f2 -> Label()
 */
public class CJumpStmt implements Node {
   public NodeToken f0;
   public Reg f1;
   public Label f2;

   public CJumpStmt(NodeToken n0, Reg n1, Label n2) {
      f0 = n0;
      f1 = n1;
      f2 = n2;
   }

   public CJumpStmt(Reg n0, Label n1) {
      f0 = new NodeToken("CJUMP");
      f1 = n0;
      f2 = n1;
   }

   public void accept(kanga.visitor.Visitor v) {
      v.visit(this);
   }
   public <R,A> R accept(kanga.visitor.GJVisitor<R,A> v, A argu) {
      return v.visit(this,argu);
   }
   public <R> R accept(kanga.visitor.GJNoArguVisitor<R> v) {
      return v.visit(this);
   }
   public <A> void accept(kanga.visitor.GJVoidVisitor<A> v, A argu) {
      v.visit(this,argu);
   }
}

