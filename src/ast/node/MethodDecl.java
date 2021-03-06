/* This file was generated by SableCC (http://www.sablecc.org/). 
 * Then modified.
 */

package ast.node;

import ast.visitor.*;
import java.util.*;

@SuppressWarnings("nls")
public final class MethodDecl extends Node
{
    private IType _type_;
    private String _name_;
    private final LinkedList<Formal> _formals_ = new LinkedList<Formal>();
    private final LinkedList<VarDecl> _varDecls_ = new LinkedList<VarDecl>();
    private final LinkedList<IStatement> _statements_ = new LinkedList<IStatement>();
    private IExp _exp_;

    public MethodDecl(int _line_, int _pos_, 
        IType _type_, String _name_,
        List<Formal> _formals_, List<VarDecl> _varDecls_,
        List<IStatement> _statements_, IExp _exp_)
    {
        super(_line_, _pos_);
        
        setType(_type_);

        setName(_name_);

        setFormals(_formals_);

        setVarDecls(_varDecls_);

        setStatements(_statements_);

        setExp(_exp_);

    }

    @Override
    public int getNumExpChildren() { return 1; }
    
    /** Constructor for method declarations without
     *  return statements.
     *  
     * @param _type_
     * @param _name_
     * @param _formals_
     * @param _varDecls_
     * @param _statements_
     */
    public MethodDecl(int _line_, int _pos_, 
            IType _type_, String _name_,
            List<Formal> _formals_, List<VarDecl> _varDecls_,
            List<IStatement> _statements_)
        {
            super(_line_, _pos_);
        
            setType(_type_);

            setName(_name_);

            setFormals(_formals_);

            setVarDecls(_varDecls_);

            setStatements(_statements_);

            setExp(null);

        }

    @Override
    public Object clone()
    {   if (this._exp_ != null) {
            return new MethodDecl(
                    this.getLine(),
                    this.getPos(),
                    cloneNode(this._type_),
                    this._name_,
                    cloneList(this._formals_),
                    cloneList(this._varDecls_),
                    cloneList(this._statements_),
                    cloneNode(this._exp_));
        } else {
            return new MethodDecl(
                    this.getLine(),
                    this.getPos(),
                    cloneNode(this._type_),
                    this._name_,
                    cloneList(this._formals_),
                    cloneList(this._varDecls_),
                    cloneList(this._statements_));        
        }
    }

    public void accept(Visitor v)
    {
        v.visitMethodDecl(this);
    }

    public IType getType()
    {
        return this._type_;
    }

    public void setType(IType node)
    {
        if(this._type_ != null)
        {
            this._type_.parent(null);
        }

        if(node != null)
        {
            if(node.parent() != null)
            {
                node.parent().removeChild(node);
            }

            node.parent(this);
        }

        this._type_ = node;
    }

    public String getName()
    {
        return this._name_;
    }

    public void setName(String name)
    {
        this._name_ = name;
    }

    public LinkedList<Formal> getFormals()
    {
        return this._formals_;
    }

    public void setFormals(List<Formal> list)
    {
        this._formals_.clear();
        this._formals_.addAll(list);
        for(Formal e : list)
        {
            if(e.parent() != null)
            {
                e.parent().removeChild(e);
            }

            e.parent(this);
        }
    }

    public LinkedList<VarDecl> getVarDecls()
    {
        return this._varDecls_;
    }

    public void setVarDecls(List<VarDecl> list)
    {
        this._varDecls_.clear();
        this._varDecls_.addAll(list);
        for(VarDecl e : list)
        {
            if(e.parent() != null)
            {
                e.parent().removeChild(e);
            }

            e.parent(this);
        }
    }

    public LinkedList<IStatement> getStatements()
    {
        return this._statements_;
    }

    public void setStatements(List<IStatement> list)
    {
        this._statements_.clear();
        this._statements_.addAll(list);
        for(IStatement e : list)
        {
            if(e.parent() != null)
            {
                e.parent().removeChild(e);
            }

            e.parent(this);
        }
    }

    public IExp getExp()
    {
        return this._exp_;
    }

    public void setExp(IExp node)
    {
        if(this._exp_ != null)
        {
            this._exp_.parent(null);
        }

        if(node != null)
        {
            if(node.parent() != null)
            {
                node.parent().removeChild(node);
            }

            node.parent(this);
        }

        this._exp_ = node;
    }

    @Override
    void removeChild(Node child)
    {
        // Remove child
        if(this._type_ == child)
        {
            this._type_ = null;
            return;
        }

        if(this._formals_.remove(child))
        {
            return;
        }

        if(this._varDecls_.remove(child))
        {
            return;
        }

        if(this._statements_.remove(child))
        {
            return;
        }

        if(this._exp_ == child)
        {
            this._exp_ = null;
            return;
        }

        throw new RuntimeException("Not a child.");
    }

    @Override
    void replaceChild(Node oldChild, Node newChild)
    {
        // Replace child
        if(this._type_ == oldChild)
        {
            setType((IType) newChild);
            return;
        }

        for(ListIterator<Formal> i = this._formals_.listIterator(); i.hasNext();)
        {
            if(i.next() == oldChild)
            {
                if(newChild != null)
                {
                    i.set((Formal) newChild);
                    newChild.parent(this);
                    oldChild.parent(null);
                    return;
                }

                i.remove();
                oldChild.parent(null);
                return;
            }
        }

        for(ListIterator<VarDecl> i = this._varDecls_.listIterator(); i.hasNext();)
        {
            if(i.next() == oldChild)
            {
                if(newChild != null)
                {
                    i.set((VarDecl) newChild);
                    newChild.parent(this);
                    oldChild.parent(null);
                    return;
                }

                i.remove();
                oldChild.parent(null);
                return;
            }
        }

        for(ListIterator<IStatement> i = this._statements_.listIterator(); i.hasNext();)
        {
            if(i.next() == oldChild)
            {
                if(newChild != null)
                {
                    i.set((IStatement) newChild);
                    newChild.parent(this);
                    oldChild.parent(null);
                    return;
                }

                i.remove();
                oldChild.parent(null);
                return;
            }
        }

        if(this._exp_ == oldChild)
        {
            setExp((IExp) newChild);
            return;
        }

        throw new RuntimeException("Not a child.");
    }
}
